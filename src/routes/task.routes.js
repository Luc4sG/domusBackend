const { Router } = require('express');
const { getReclamos, crearReclamo, getPropiedades} = require('../controllers/task.controllers');

const router = Router();

router.get('/',(req, res) =>{
    res.send('Hello World')
})

router.get('/propiedades', getPropiedades);
router.get('/reclamos/:id',getReclamos);


router.post('/crearReclamo',crearReclamo);



module.exports = router;