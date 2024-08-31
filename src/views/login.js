const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const app = express();
import {Router} from 'express'
import pool from '../database.js'

app.use(bodyParser.urlencoded({ extended: true }));

// Configuración de la base de datos
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'tu_base_de_datos'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Conectado a la base de datos');
});

// Ruta para manejar el inicio de sesión
app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    const query = 'SELECT * FROM visitantes WHERE username = ? AND password = ?';
    db.query(query, [username, password], (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send('Inicio de sesión exitoso');
        } else {
            res.send('Usuario o contraseña incorrectos');
        }
    });
});

app.listen(3000, () => {
    console.log('Servidor iniciado en el puerto 3000');
});