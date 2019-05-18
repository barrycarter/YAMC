import React, { Component } from 'react'
import axios from 'axios'

class PlayerBoard extends Component {
  state = {
    lat: '',
    lng: '',
    location: []
  }

  handleChangeLat = event => {
    this.setState({
      lat: event.target.value
    })
  }

  handleChangeLng = event => {
    this.setState({
      lng: event.target.value
    })
  }

  handleSubmitLocation = event => {
    event.preventDefault()
    // console.log(this.state.lat)
    // console.log(this.state.lng)

    // wtf???
    let bbox = [
      this.state.lng - 1 / 7200,
      this.state.lat - 1 / 7200,
      this.state.lng + 1 / 7200,
      this.state.lat + 1 / 7200
    ].join(',')

    axios
      .get(
        `http://ws.terramapadventure.com:8080/geoserver/wms?request=GetFeatureInfo&service=WMS&version=1.1.1&layers=TMA-YAMC:ne_10m_admin_0_countries&styles=&srs=EPSG%3A4326&format=image%2Fpng&bbox=${bbox}&width=1&height=1&query_layers=TMA-YAMC:ne_10m_admin_0_countries&info_format=application/json&propertyName=NAME_EN&feature_count=1&x=1&y=1`
      )
      .then(res => {
        this.setState({ location: res.data.features })
        console.log(this.state.location)
      })
      .catch(err => {
        console.log(err)
      })
  }

  render () {
    return (
      <div>
        <span>
          Location:
          {this.state.location.map(info => {
            return info.properties['NAME']
          })}
        </span>
        <form onSubmit={this.handleSubmitLocation}>
          <div>
            <label>
              Latitude:
              <input
                type='text'
                name='latitude'
                value={this.state.lat}
                onChange={this.handleChangeLat}
              />
            </label>
          </div>
          <div>
            <label>
              Longitude:
              <input
                type='text'
                name='longitude'
                value={this.state.lng}
                onChange={this.handleChangeLng}
              />
            </label>
          </div>
          <input type='submit' value='submit' />
        </form>
        <div>Player Movement</div>
        <div>Map</div>
      </div>
    )
  }
}

export default PlayerBoard
