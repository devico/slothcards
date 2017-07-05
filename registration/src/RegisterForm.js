import React, { Component, PropTypes } from 'react';
import {Form, Col, ControlLabel, FormControl, FormGroup, Button} from "react-bootstrap";


var RegisterForm = React.createClass({
  static propTypes = {
    email: PropTypes.string.isRequired,
    password: PropTypes.string.isRequired,
    onRegisterSubmit: PropTypes.func.isRequired
  },
  getInitialState: function() {
    return {email: '', password: ''};
  },
  handleEmailChange: function(e) {
    this.setState({email: e.target.value});
  },
  handlePasswordChange: function(e) {
    this.setState({password: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var email = this.state.email;
    var password = this.state.password;
    if (!email || !password) {
      return;
    }
    this.props.onRegisterSubmit({email: email, password: password});
    this.setState({email: '', password: ''});
  },
  render: function() {
    return (
      <Form horizontal onSubmit={this.handleSubmit}>

        <FormGroup>
          <Col componentClass={ControlLabel} sm={2}>
            Email
          </Col>
          <Col sm={10}>
            <FormControl
              type="text"
              placeholder="Your email"
              value={this.state.email}
              onChange={this.handleEmailChange}
            />
          </Col>
        </FormGroup>

        <FormGroup>
          <Col componentClass={ControlLabel} sm={2}>
            Comment
          </Col>
          <Col sm={10}>
            <FormControl
              type="password"
              placeholder="Your password"
              value={this.state.password}
              onChange={this.handlePasswordChange}
            />
            />
          </Col>
        </FormGroup>

        <FormGroup>
          <Col smOffset={2} sm={10}>
            <Button 
              type="submit" 
              bsStyle="success" 
              bsSize="large" 
              block>
              Post
            </Button>
          </Col>
        </FormGroup>

      </Form>
    );
  }
});

export default RegisterForm;
