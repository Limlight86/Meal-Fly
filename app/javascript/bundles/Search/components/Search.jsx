import React, { Component } from 'react'
import axios from 'axios'

const badgeClasses = {
  'Category': 'badge badge-orange ml-2',
  'Recipe': 'badge badge-green ml-2'
}

class Search extends Component {
  state = { term: "", results: [] }

  handleChange = event => {
    const term = event.target.value
    axios.get(`/search_results.json?term=${term}`)
      .then(response => this.setState({ results: response.data }))
  }

  render(){
    const { results } = this.state
    return(
      <React.Fragment>
        <input
          className="form-control mr-sm-2"
          type="search"
          placeholder="Search"
          autoComplete="off"
          onChange={this.handleChange}
        />
        { results.length > 0 &&
          <ul className="list-group" style={{position: 'absolute', zIndex: 10}}>
            {
              results.map((result, i) => {
                return(
                  <li className="list-group-item" key={i}>
                    <a href={result.location}>
                      { result.name }
                      <span className={badgeClasses[result.type]}>{result.type}</span>
                    </a>
                  </li>
                )
              })
            }
          </ul>
        }
      </React.Fragment>
    )
  }
}

export default Search
