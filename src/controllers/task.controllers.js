const pool = require('../db')


const getPropiedades = async (req, res) => {
    try {
        const response = await pool.query('SELECT idPropiedad ,direccionPropiedad FROM propiedades WHERE idCliente = 1');

        if (response.rows.length === 0) {
            return res.status(404).json({
                message: "No se encontraron propiedades"
        });
        }

        res.json(response.rows);

    } catch (e) {
        console.log(e);
        res.send('Error1');
    }
}


const getReclamos = async (req, res) => {
    try {
        const response = await pool.query('SELECT r.tituloReclamo, r.descripcionReclamo, r.fechaReclamo, r.estadoReclamo, p.direccionPropiedad FROM Reclamos r INNER JOIN Propiedades p ON r.propiedadReclamo = p.idPropiedad WHERE r.clienteReclamo= $1', [req.params.id]);

        if (response.rows.length === 0) {
            return res.status(404).json({
                message: "No se encontraron reclamos"
            });
        }
        
        res.json(response.rows);
    
    } catch (e) {
        console.log(e);
        res.send('Error2');
    }
}

const crearReclamo = async (req, res) => {
    try {   
        const { reclamo } = req.body
        console.log(reclamo)
        
        //const PR= parseInt() 
         const result = await pool.query('INSERT INTO reclamos (tituloReclamo, descripcionReclamo, propiedadReclamo, clienteReclamo) VALUES ($1, $2, $3, $4)', [
            reclamo.tituloReclamo,
            reclamo.descripcionReclamo,
            reclamo.propiedadReclamo,
            reclamo.clienteReclamo,
        ]); 

        res.send(result)
    } catch (e) {
        console.log(e);
        res.send('Error3');
    } 
}



module.exports = {
    getReclamos,
    crearReclamo,
    getPropiedades,
}