import React from 'react';
import ReactDOM from 'react-dom';
import RegisterWindow from './RegisterWindow';
import './index.css';

ReactDOM.render(
  <RegisterWindow url="/sessions/new" />, 
  document.getElementById('root')
);
