import {Router} from 'express'
import pool from '../database.js'

const router = Router();

router.get('/adds', (req,res)=>{
    res.render('usuarios/adds');
});

//registro de usuarios
router.post('/lists', async(req, res)=>{
    
    try{
        const {nombre, apellido, cedula, username, password, rol_id} = req.body;
        const newUsuario = {
            nombre, apellido, cedula, username, password, rol_id
        }
        await pool.query('INSERT INTO usuarios SET ?', [newUsuario]);
        res.redirect('/lists');
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
});

router.get('/lists', async(req, res)=>{
    try{
        const [result] = await pool.query('SELECT * FROM usuarios');
        res.render('usuarios/lists', {usuarios: result});
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
});
// render del loging
router.get('/index', async(req, res)=>{
    try{
        const [result] = await pool.query('SELECT * FROM usuarios');
        res.render('usuarios/index', {usuarios: result});
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
});

router.get('/edits/:id', async(req, res)=>{
    try{
        const {id} = req.params;
        const [usuarios] = await pool.query('SELECT * FROM usuarios WHERE id = ?', [id]);
        const usuarioEdit = usuarios[0];
        res.render('usuarios/edits', {usuarios: usuarioEdit});
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
})

router.post('/edits/:id', async(req, res)=>{
    try{
        const {nombre, apellido, cedula, username, password, rol_id} = req.body;
        const {id} = req.params;
        const editUsuario = {nombre, apellido,cedula, username, password, rol_id};
        await pool.query('UPDATE usuarios SET ? WHERE id = ?', [editUsuario, id]);
        res.redirect('/lists');
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
})

router.get('/deletes/:id', async(req, res)=>{
    try{
        const {id} = req.params;
        await pool.query('DELETE FROM usuarios WHERE id = ?', [id]);
        res.redirect('/lists');
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
});
export default router;