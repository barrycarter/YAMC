import React, { Component } from 'react'
// import logo from './logo.svg';
import './App.css'

class App extends Component {
  state = {
    // d: 0,
    // m: 0,
    // s: 0,
    decimal: 0
    // x: 0,
    // y: 0
  }

  f = event => {
    console.log('t', event.target.name)
    if (event.target.name == 'decimal') {
      console.log('hit dec')
      this.setState({
        decimal: event.target.value
      })
    }
    console.log('method', this.state)
    console.log('v', event.target.value)
  }

  render () {
    console.log('render', this.state)
    let d = Math.floor(this.state.decimal)
    let m = Math.floor((this.state.decimal - d) * 60)
    let decimal = this.state.decimal
    console.log(d)
    console.log(this.state)
    return (
      <div className='App'>
        Input Box
        <div>
          <form>
            <input
              onChange={this.f}
              type='text'
              value={this.state.decimal}
              name='decimal'
            />
            <input type='text' value={d} name='d' />
            <input type='text' value={m} name='m' />
            <input type='text' value={this.state.s} name='s' />
            <input type='text' value={this.state.x} name='x' />
            <input type='text' value={this.state.y} name='y' />
            {/* <button>Submit</button> */}
          </form>
        </div>
        {this.state.decimal}
        {/* DMS:
        <TextThing size='2' name='d' obj={this} />
        <TextThing size='2' name='m' obj={this} />
        <TextThing size='2' name='s' obj={this} />
        <p />
        Decimal:
        <TextThing size='8' name='decimal' obj={this} />
        <p />
        X:
        <TextThing size='8' name='x' obj={this} />
        Y:
        <TextThing size='8' name='y' obj={this} /> */}
      </div>
    )
  }
}

// class TextThing extends Component {
//   constructor (props) {
//     super(props)
//     this.state = {
//       name: props.name,
//       size: props.size,
//       obj: props.obj,
//       value: props.value
//     }
//     this.onChange.bind(this)
//   }

//   onChange (event) {
//     this.setState({ value: event.target.value })
//   }

//   render () {
//     return (
//       <input
//         name={this.state.name}
//         size={this.state.size}
//         value={this.state.value}
//         onBlur={this.onChange}
//       />
//     )
//   }
// }

export default App
