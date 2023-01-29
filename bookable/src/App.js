import axios from 'axios';
import './App.css';
import Books from './components/books';
import { useState, useEffect } from 'react';
const API_URL = 'http://127.0.0.1:3000/api/v1/books';

function getApiData() {
  return axios.get(API_URL)
    .then(response => response.data)
}
function App() {
  const [books, setBooks] = useState([]);
  useEffect(() => {
    let mounted = true;
    getApiData().then((items) => {
      if (mounted) {
        setBooks(items);
      }
    });
    return () => { mounted = false };
  }, []);
  return (
    <div>
      <Books books={ books } />
    </div>
  );
}

export default App;
