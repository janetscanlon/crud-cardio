const express = require('express');
const pool = require('../modules/pool.js');

const router = express.Router();


// GET /books - - - - - - - Respond with all the books.
router.get('/', (req,res) => {
    console.log('GET /books')

    //sql query to send to the db
    const sqlText = `
                    SELECT * FROM books
                    ORDER BY id;`
    
    //use pool.query to send sql to the db
    pool.query(sqlText)
        .then((dbResult) => {
            let booksRequested = dbResult.rows
            res.send(booksRequested)
        })
        .catch((dbError) => {
            console.log('DB query failed inside GET /books')
            console.log('error is:', dbError)
            res.sendStatus(500)
    })
})
// GET /books/:id - - - - - Respond with one thing.

// POST /books - - - - - -  Create one thing.

// DELETE /books/:id - - -  Delete one thing.

// PUT /books/:id - - - - - Update one thing.



module.exports = router;
