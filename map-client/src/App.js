import React, { Component } from 'react'
// import logo from './logo.svg';
import './App.css'

class App extends Component {
  state = {
    lat: 0,
    lng: 0,
    latDeg: 0,
    latMin: 0,
    latSec: 0,
    lngDeg: 0,
    lngMin: 0,
    lngSec: 0,
    x: 0,
    y: 0
  }

  f = event => {
    if (event.target.name === 'decimal') {
      this.setState({
        decimal: event.target.value
      })
    } else if (event.target.name === 'd') {
      this.setState({
        decimal: event.target.value
      })
    } else {
      console.log('nothing')
    }
  }

  render () {
    let d = Math.floor(this.state.decimal)
    let m = Math.floor((this.state.decimal - d) * 60)
    let s = Math.floor((this.state.decimal - d - m / 60) * 3600)
    let x = 0
    let y = 0
    return (
      <div className='App'>
        Input Box
        <div>
          Latitude
          <input
            onChange={this.f}
            type='text'
            value={this.state.decimal}
            name='decimal'
          />
          <input onChange={this.f} type='text' value={d} name='d' />
          <input type='text' value={this.latDeg} name='m' />
          <input type='text' value={this.latDeg} name='m' />
          <input type='text' value={this.latMin} name='s' />
          <input type='text' value={x} name='x' />
          <input type='text' value={y} name='y' />
        </div>
        {this.state.decimal}
        <div>
          Longitude
          <input
            onChange={this.f}
            type='text'
            value={this.state.decimal}
            name='decimal'
          />
          <input onChange={this.f} type='text' value={d} name='d' />
          <input type='text' value={m} name='m' />
          <input type='text' value={s} name='s' />
          <input type='text' value={x} name='x' />
          <input type='text' value={y} name='y' />
        </div>
      </div>
    )
  }
  // lat: 0,
  // lng: 0,
  // latDeg: 0,
  // latMin: 0,
  // latSec: 0,
  // lngDeg: 0,
  // lngMin: 0,
  // lngSec: 0,
  // x: 0,
  // y: 0
}

export default App
