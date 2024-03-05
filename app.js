const express = require('express');
const bodyParser = require('body-parser');
const { v4: uuidv4 } = require('uuid');

const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(bodyParser.json());

// Array to store JSON objects
let data = [];

// Route to get all JSON objects
app.get('/data', (req, res) => {
  res.json(data);
});

// Route to add a new JSON object
app.post('/data', (req, res) => {
  const newData = { ...req.body, id: uuidv4() }; // Add UUIDv4 to the new object
  data.push(newData);
  res.status(201).json(newData);
});

// Route to get a specific JSON object by blockNum
app.get('/data/:blockNum', (req, res) => {
  const blockNum = parseInt(req.params.blockNum);
  const foundData = data.find(obj => obj.blockNum === blockNum);
  if (foundData) {
    res.json(foundData);
  } else {
    res.status(404).json({ error: 'Data not found' });
  }
});

// Route to update a specific JSON object by blockNum
app.put('/data/:blockNum', (req, res) => {
  const blockNum = parseInt(req.params.blockNum);
  const newData = req.body;
  const index = data.findIndex(obj => obj.blockNum === blockNum);
  if (index !== -1) {
    data[index] = { ...newData, id: data[index].id }; // Preserve the existing UUID
    res.json(data[index]);
  } else {
    res.status(404).json({ error: 'Data not found' });
  }
});

// Route to delete a specific JSON object by blockNum
app.delete('/data/:blockNum', (req, res) => {
  const blockNum = parseInt(req.params.blockNum);
  const index = data.findIndex(obj => obj.blockNum === blockNum);
  if (index !== -1) {
    const deletedData = data.splice(index, 1);
    res.json(deletedData[0]);
  } else {
    res.status(404).json({ error: 'Data not found' });
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
