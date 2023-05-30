import React, { useState } from 'react';
import './formulario.css'; // Importa el archivo de estilos CSS

const Formulario = () => {
  const [id, setId] = useState('')
  const [titulo, setTitulo] = useState('');
  const [descripcion, setDescripcion] = useState('');
  const [puntuacion, setPuntuacion] = useState('');
  const [fechaSalida, setFechaSalida] = useState('');
  const [esParaMayores, setEsParaMayores] = useState(false);
  

  const handleSubmit = (e) => {
    e.preventDefault();
    const idNumero = parseInt(id, 10);
    fetch('http://localhost:3003/peliculas', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        id: idNumero,
        titulo,
        descripcion,
        puntuacion,
        fechaSalida,
        esParaMayores
      })
    })
    .then(res => {
      if(res.status == 200){
        alert('SE CREO LA PELICULA CON EXITO');
      }
    })
    .catch(err => {
      console.log(err);
    })
    // Limpia los campos del formulario después del envío
    setId('')
    setTitulo('');
    setDescripcion('');
    setPuntuacion('');
    setFechaSalida('');
    setEsParaMayores(false);
  };

  return (
    <form className="formulario" onSubmit={handleSubmit}>
        <h2>Agregar nueva pelicula</h2>
        <label htmlFor="id">id:</label>
      <input
        type="text"
        id="id"
        value={id}
        onChange={(e) => setId(e.target.value)}
      />
      <label htmlFor="titulo">Título:</label>
      <input
        type="text"
        id="titulo"
        value={titulo}
        onChange={(e) => setTitulo(e.target.value)}
      />

      <label htmlFor="descripcion">Descripción:</label>
      <textarea
        id="descripcion"
        value={descripcion}
        onChange={(e) => setDescripcion(e.target.value)}
      ></textarea>

      <label htmlFor="puntuacion">Puntuación:</label>
      <input
        type="number"
        id="puntuacion"
        value={puntuacion}
        onChange={(e) => setPuntuacion(e.target.value)}
      />

      <label htmlFor="fechaSalida">Fecha de salida (Formato fecha: AAAA-MM-DD):</label>
      <input
        type="text"
        id="fechaSalida"
        value={fechaSalida}
        onChange={(e) => setFechaSalida(e.target.value)}
      />

      <label htmlFor="esParaMayores">¿Es para mayores de 18 años?</label>
      <input
        type="checkbox"
        id="esParaMayores"
        checked={esParaMayores}
        onChange={(e) => setEsParaMayores(e.target.checked)}
      />

      <button type="submit">Enviar</button>
    </form>
  );
};

export default Formulario;







