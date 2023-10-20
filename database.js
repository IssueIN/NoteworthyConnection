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


async function fetchObjects(objectName) {
  try {
    const [results] = await pool.query(`SELECT * FROM ${objectName}`);
    return results;
  } catch (err) {
    console.error(`Error fetching ${objectName}: `, err)
  }
}

async function fetchMusicians() {
  return fetchObjects('musicians')
}

async function fetchCategories() {
  return fetchObjects('categories')
}

async function fetchObject(id, objectName, idName) {
  try {
    const [results] = await pool.query(`SELECT * 
    FROM ${objectName} 
    WHERE ${idName}= ? `, [id])
    return results[0];
  } catch (err){
    console.error("Error fetching musicians by id:", id)
  }
}

async function fetchMusician(mid) {
  return fetchObject(mid, 'musicians', 'mid')
}

async function fetchCategory(cid) {
  return fetchObject(cid, 'categories', 'cid')
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

async function fetchAbyBid(A_objectName, B_objectName, Bid) {
  const A_Short = A_objectName.substring(0,1)
  const B_Short = B_objectName.substring(0,1)
  try {
    const [results] = await pool.query(`
      SELECT ${A_Short}.${A_Short}id, ${A_Short}.name 
      FROM ${A_objectName} ${A_Short}
      INNER JOIN musician_categories ${B_Short}${A_Short} ON ${A_Short}.${A_Short}id = ${B_Short}${A_Short}.${A_Short}id
      WHERE ${B_Short}${A_Short}.${B_Short}id = ?
    `, [Bid]);
    return results;
  } catch (err) {
    console.error(`Error fetching ${A_objectName} for ${B_objectName} ID ${Bid}:`, err);
  }
}

async function fetchCategoriesByMusicianId(mid) {
  return fetchAbyBid('categories', 'musicians', mid)
}

async function fetchMusiciansByCategoryId(cid) {
  return fetchAbyBid('musicians', 'categories', cid)
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
  createMusician,
  fetchCategoriesByMusicianId,
  fetchMusiciansByCategoryId
}





