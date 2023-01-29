import React from 'react'


export default function Books(props) {
    return (
        <div>
            <h1>Books from api are showing here</h1>
            { props.books.map((book) => {
                console.log(book.body);
                return <div key={ book.id }>
                    <h5>{ book.title }</h5>
                    <p>{ book.body }</p>
                </div>
            }) }
        </div>
    );
}