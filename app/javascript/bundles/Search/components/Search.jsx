import React, { Component } from 'react'
import axios from 'axios'

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
          <div>
            <h3>Results</h3>
            {
              results.map((result, i) => {
                return(
                  <p key={i}>
                    <a href={result.location}>
                      {result.name}
                    </a>
                  </p>
                )
              })
            }
          </div>
        }
      </React.Fragment>
    )
  }
}

export default Search
