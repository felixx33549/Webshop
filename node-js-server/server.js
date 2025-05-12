const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());

const pool = mysql.createPool({
  host: 'localhost',
  user: 'serveruser',
  password: 'server',
  database: 'webshop',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

app.get('/data', (req, res) => {
  const sql = 'SHOW tables';
  pool.query(sql, (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send('Database query failed');
      return;
    }
    res.send(results);
  });
});

app.get('/products', (req, res) => {
  const sql = 'SELECT * FROM products';
  pool.query(sql, (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send('Database query failed');
      return;
    }
    res.send(results);
  });
});

app.get('/category', (req, res) => {
  const sql = 'SELECT * FROM category';
  pool.query(sql, (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send('Database query failed');
      return;
    }
    res.send(results);
  });
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});
