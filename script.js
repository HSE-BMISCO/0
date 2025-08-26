const form = document.getElementById('contractorForm');
const tableBody = document.querySelector('#contractorsTable tbody');

function loadContractors() {
  tableBody.innerHTML = '';
  const contractors = JSON.parse(localStorage.getItem('contractors') || '[]');
  contractors.forEach((c, index) => {
    const row = document.createElement('tr');
    row.innerHTML = `
      <td>${c.name}</td>
      <td>${c.manager}</td>
      <td><button onclick="deleteContractor(${index})">❌</button></td>
    `;
    tableBody.appendChild(row);
  });
}

function deleteContractor(index) {
  const contractors = JSON.parse(localStorage.getItem('contractors') || '[]');
  contractors.splice(index, 1);
  localStorage.setItem('contractors', JSON.stringify(contractors));
  loadContractors();
}

form.addEventListener('submit', e => {
  e.preventDefault();
  const name = document.getElementById('name').value;
  const manager = document.getElementById('manager').value;
  const contractors = JSON.parse(localStorage.getItem('contractors') || '[]');
  contractors.push({ name, manager });
  localStorage.setItem('contractors', JSON.stringify(contractors));
  form.reset();
  loadContractors();
});

loadContractors();
