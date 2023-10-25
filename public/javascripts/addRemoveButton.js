function getMusiciansFromDataAttribute() {
  const element = document.getElementById('musiciansData');
  return JSON.parse(element.getAttribute('data-musicians'));
}

function addDropdown() {
  const musicianList = document.getElementById('musicianList');
  const newDropdown = document.createElement('div');
  newDropdown.className = 'musicianDropdown';
  
  const musicians = getMusiciansFromDataAttribute();

  // Create select element
  const select = document.createElement('select');
  select.name = "musicians[]";
  
  // Populate options dynamically using the musicians data
  musicians.forEach(musician => {
    const option = document.createElement('option');
    option.value = musician.mid;
    option.textContent = musician.name;
    select.appendChild(option);
  });
  
  // Create remove button
  const button = document.createElement('button');
  button.type = "button";
  button.textContent = "Remove";
  button.onclick = function() {
    removeDropdown(button);
  };
  
  newDropdown.appendChild(select);
  newDropdown.appendChild(button);
  musicianList.appendChild(newDropdown);
}

function removeDropdown(buttonElem) {
  const musicianDropdown = buttonElem.parentElement;
  musicianDropdown.remove();
}

