
// a function to render /books! 


// a function to GET /books
function getBooks(){
    axios({
        method: 'GET',
        url: '/books'
    })
    .then((response) => {
        console.log('GET /books response.data', response.data)
        //reder function here 
    })
    .catch((error) => {
        console.log('Error in GET /books', error)
    })
}

getBooks()