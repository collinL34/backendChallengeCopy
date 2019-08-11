import React, { Component } from 'react';
import axios from 'axios';

class ProvidersIndex extends Component {
  constructor(props) {
      super(props)
      this.state = {
          companies: [],
          originFilter: '',
          destinationFilter: ''
      }
  }

  componentDidMount() {
      axios.get('/rates_data_dump')
      .then(response => {
          this.setState({
              companies: response.data
          })
      })
      .catch(error => console.log(error))
  }

  onChangeHandlerOrigin( { target } ) {
    this.setState({
      originFilter: target.value.toUpperCase()
    })
  }

  onChangeHandlerDestination( { target } ) {
    this.setState({
      destinationFilter: target.value.toUpperCase()
    })
  }

  render() {
    return (
      <div className="">
        <h2 className="Header">Providers</h2>
        Filter Destination:
        <input value={this.state.input} type="text" 
                                        value={ this.state.payloadBox }
                                        placeholder="Origin Code" 
                                        onChange={this.onChangeHandlerOrigin.bind(this)}>
        </input>
        To 
        <input value={this.state.input} type="text"
                                        value={ this.state.payloadBox }
                                        placeholder="Destination Code"
                                        onChange={this.onChangeHandlerDestination.bind(this)}>
        </input>
        
        <table>
          <thead>
            <tr>
              <th>
                Company Name
              </th>
              <th>
                Flat Shipping Rate(USD)
              </th>
              <th>
                Shipping Origin
              </th>
              <th>
                Shipping Destination
              </th>
              <th>
                Shipping Rate(USD)
              </th>
            </tr>
          </thead>
          <tbody>
            {this.state.companies.filter(( data ) => this.state.originFilter === '' ||
                                                     data.origin_code.includes( this.state.originFilter ))
              .filter(( data ) => this.state.destinationFilter === '' ||
                                  data.destination_code.includes( this.state.destinationFilter ))
              .map(( rate ) => {
                return (
                  <tr>
                    <td>{ rate.company_name }</td>
                    <td>${ rate.flat_shipping_rate_usd }</td>
                    <td>{ rate.origin_code }</td>
                    <td>{ rate.destination_code }</td>
                    <td>${ rate.shipping_rate_usd }</td>
                  </tr>
                )
            })}
          </tbody>
        </table>
      </div>
    );
  }
}

export default ProvidersIndex;
