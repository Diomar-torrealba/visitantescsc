import {Router} from 'express'
import pool from '../database.js'

const router = Router();

router.get('/add', (req,res)=>{
    res.render('personas/add');
});

router.post('/list', async(req, res)=>{
    try{
        
        const {nombre, apellido, cedula, telefono,filial,departamento} = req.body;
        const newPersona = {
            nombre,apellido,cedula,telefono,filial,departamento
        }
        await pool.query('INSERT INTO visitantes SET ?', [newPersona]);
        res.redirect('/list');
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
});

router.get('/list', async(req, res)=>{
    try{
        const [result] = await pool.query('SELECT * FROM visitantes');
        
        res.render('personas/list', {personas: result});
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
});

router.get('/edit/:id', async(req, res)=>{
    try{
        const {id} = req.params;
        const [persona] = await pool.query('SELECT * FROM visitantes WHERE id = ?', [id]);
        const personaEdit = persona[0];
        res.render('personas/edit', {persona: personaEdit});
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
})

router.post('/edit/:id', async(req, res)=>{
    try{
        const {nombre, apellido, cedula, telefono,filial,departamento} = req.body;
        const {id} = req.params;
        const editPersona = {nombre, apellido, cedula, telefono,filial,departamento};
        await pool.query('UPDATE visitantes SET ? WHERE id = ?', [editPersona, id]);
        res.redirect('/list');
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
})

router.get('/delete/:id', async(req, res)=>{
    try{
        const {id} = req.params;
        await pool.query('DELETE FROM visitantes WHERE id = ?', [id]);
        res.redirect('/list');
    }
    catch(err){
        res.status(500).json({message:err.message});
    }
});
export default router;