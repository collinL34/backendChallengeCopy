import React, { Component } from 'react';
import axios from 'axios';

class ProvidersIndex extends Component {
  constructor(props) {
        super(props)
        this.state = {
            companies: []
        }
  }

  OnChangeHandlerOrigin( e ) {
    this.setState(( state, props ) => {
      companies: state.companies.filter(( data ) => data.origin.includes( e.target.value ))
    })
  }

  OnChangeHandlerDestination( e ) {
    this.setState(( state, props ) => {
      companies: state.companies.filter(( data ) => data.destination.includes( e.target.value ))
    })
  }

  componentDidMount() {
      axios.get('http://localhost:3000/rates_data_dump')
      .then(response => {
          console.log('got it were awesome', response)
          this.setState({
              companies: response.data
          })
      })
      .catch(error => console.log(error))
  }

  render() {
    return (
      <div className="">
        <h2>Providers</h2>
        Filter Destination:
        <input value={this.state.input} type="text" placeholder="Origin Code" onChange={this.onChangeHandlerOrigin.bind(this)}>
        </input>
        To 
        <input value={this.state.input} type="text" placeholder="Destination Code" onChange={this.onChangeHandlerDestination.bind(this)}>
        </input>
        
        <table class="table">
          <thead>
            <tr>
              <th>
                Company Name
              </th>
              <th>
                Flat Shipping Rate
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
            {this.state.companies.map(( rate ) => {
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
