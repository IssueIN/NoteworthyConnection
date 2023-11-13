//import mysql from 'mysql2';
if(process.env.NODE_ENV !== 'production') {
  require('dotenv').config()
}

const fs = require('fs')
const mysql = require('mysql2')

const pool = mysql.createPool({
  host: process.env.DATABASE_HOST,
  port: process.env.DATABASE_PORT,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE_NAME,
  // ssl: {
  //   ca: fs.readFileSync(__dirname + '/certs/global-bundle.pem')
  // }
}).promise()

async function testConnection() {
  try {
      const connection = await pool.getConnection();
      console.log("Successfully connected to the database.");
      connection.release(); // Always release the connection after usage
  } catch (error) {
      console.error("Error connecting to the database:", error);
  }
}

testConnection();


async function fetchObjects(tableName) {
  try {
    const [results] = await pool.query(`SELECT * FROM ${tableName}`);
    return results;
  } catch (err) {
    console.error(`Error fetching ${tableName}: `, err)
  }
}

async function fetchMusicians() {
  return fetchObjects('musicians')
}

async function fetchCategories() {
  return fetchObjects('categories')
}

async function fetchPrimaryCategories() {
  try {
    const [results] = await pool.query(`SELECT * FROM categories LIMIT 6`);
    return results;
  } catch (err) {
    console.error(`Error fetching categories: `, err)
  }
}

async function fetchObject(col, tableName) {
  try {
    const [results] = await pool.query(`SELECT * 
    FROM ${tableName} 
    WHERE ${Object.keys(col)[0]}= ? `, [Object.values(col)[0]])
    return results[0];
  } catch (err){
    console.error("Error fetching musicians by id:", Object.values(col)[0])
  }
}

async function fetchMusician(mid) {
  return fetchObject({mid}, 'musicians')
}

async function fetchCategory(cid) {
  return fetchObject({cid}, 'categories')
}

async function fetchMusicianId(name) {
  return fetchObject({name}, 'musicians')
}

async function fetchMusicianIds(names) {
  if (!Array.isArray(names) || names.length === 0) {
    throw new Error("Invalid names input");
  }

  const placeholders = names.map(() => '?').join(',');
  try {
    const [results] = await pool.query(`SELECT mid FROM musicians WHERE name IN (${placeholders})`, names);
    return results.map(row => row.mid);
  } catch (err) {
    console.error("Error fetching musician IDs:", err);
    return [];
  }
}

async function createMusician(name) {
  const [result] =await pool.query(`
    INSERT INTO musicians (name)
    VALUES (?)
    `, [name]
  )
  const mid = result.insertId
  return fetchMusicians(mid);
}

// async function fetchCategoriesByMusicianId(mid) {
//   try {
//     const [results] = await pool.query(`
//       SELECT c.cid, c.name 
//       FROM categories c
//       INNER JOIN musician_categories mc ON c.cid = mc.cid
//       WHERE mc.mid = ?
//     `, [mid]);
//     return results;
//   } catch (err) {
//     console.error(`Error fetching categories for musician ID ${mid}:`, err);
//   }
// }

// async function fetchAbyBid(A_tableName, B_tableName, Bid) {
//   const A_Short = A_tableName.substring(0,1)
//   const B_Short = B_tableName.substring(0,1)
//   try {
//     const [results] = await pool.query(`
//       SELECT ${A_Short}.${A_Short}id, ${A_Short}.name 
//       FROM ${A_tableName} ${A_Short}
//       INNER JOIN musician_categories ${B_Short}${A_Short} ON ${A_Short}.${A_Short}id = ${B_Short}${A_Short}.${A_Short}id
//       WHERE ${B_Short}${A_Short}.${B_Short}id = ?
//     `, [Bid]);
//     return results;
//   } catch (err) {
//     console.error(`Error fetching ${A_tableName} for ${B_tableName} ID ${Bid}:`, err);
//   }
// }

async function fetchAbyBid(A_tableName, A_primaryKey, B_tableName, B_primaryKey, linkTableName, Bid) {
  try {
    const [results] = await pool.query(`SELECT A.* 
      FROM ${A_tableName} AS A
      INNER JOIN ${linkTableName} AS Link ON A.${A_primaryKey} = Link.${A_primaryKey}
      WHERE Link.${B_primaryKey} = ?
    `, [Bid]);
    return results
  } catch (err) {
    console.error(`Error fetching ${A_tableName} for ${B_tableName} ID ${Bid}:`, err);
  }
}

async function fetchCategoriesByMusicianId(mid) {
  return fetchAbyBid('categories','cid', 'musicians','mid', 'musician_categories', mid)
}

async function fetchMusiciansByCategoryId(cid) {
  return fetchAbyBid('musicians','mid', 'categories','cid', 'musician_categories', cid)
}

async function createObject(tableName, data) {
  const columns = Object.keys(data).join(',');
  const values = Object.values(data);
  const placeholders = new Array(values.length).fill('?').join(',')

  const sql_query = `INSERT INTO ${tableName} (${columns}) VALUES (${placeholders})`;

  try {
    const [results] = await pool.query(sql_query, values);
    return results.insertId
  } catch(err) {
    console.error(`Error creating ${tableName} Object`, err);
  }
}

async function createClient(name, email) {
  return createObject('clients', {name, email})
}

async function createClientMessage(client_id, message) {
  return createObject('client_messages', { client_id, message });
}

async function createClientPreferredMusician(client_id, mid) {
  return createObject('client_preferred_musicians', { client_id, mid });
}

// fetchCategoriesByMusicianId(1)
// .then(results => {
//   console.log(results);
// })
// .catch(error => {
//   console.error(error)
// })

// fetchMusician(100)
// .then(results => {
//   console.log(results);
// })
// .catch(error => {
//   console.error("Error:", error);
// })

// createMusician('test4')
// .then(result => {
//   console.log(result);
// })
// .catch(error => {
//   console.error('Error:', error)
// })

module.exports = {
  fetchMusicians,
  fetchCategories,
  fetchMusician,
  fetchCategory,
  fetchPrimaryCategories,
  fetchMusicianId,
  fetchMusicianIds,
  createMusician,
  fetchCategoriesByMusicianId,
  fetchMusiciansByCategoryId,
  createClient,
  createClientMessage,
  createClientPreferredMusician
}





