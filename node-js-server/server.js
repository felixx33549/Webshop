const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());
app.use(cors());

/* const db = mysql.createConnection({
  host: 'localhost',
  user: 'serveruser',
  password: 'server',
  database: 'webshop'
}); */

const pool = mysql.createPool({
  host: 'localhost',
  user: 'serveruser',
  password: 'server',
  database: 'webshop',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  enableKeepAlive: true,
  keepAliveInitialDelay: 10000
});

pool.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL Connected...');
});

app.get('/data', (req, res) => {
  let sql = 'SHOW tables';
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send(results);
  });
});

app.get('/products', (req, res) => {
  let sql = 'SELECT * FROM products';
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send(results);
  });
});

app.get('/category', (req, res) => {
  let sql = 'SELECT * FROM category';
  pool.query(sql, (err, results) => {
    if (err) throw err;
    res.send(results);
  });
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});
