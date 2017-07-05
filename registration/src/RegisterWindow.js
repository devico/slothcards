import React from 'react';
import $ from 'jquery';
import RegisterForm from './RegisterForm';
import {Row, Well} from "react-bootstrap";

var RegisterWindow = React.createClass({
  render: function() {
    return (
      <Row>
        <Well bsSize="large">
          <RegisterForm onRegisterSubmit={this.handleSubmit} />
        </Well>
        <h3>Some thing</h3>
        <CommentList data={this.state.data} />
      </Row>
    );
  }
});


export default RegisterWindow;
