import React, { Component } from 'react'
import axios from 'axios'

class Search extends Component {
  state = { term: "", results: [] }

  handleChange = event => {
    const term = event.target.value
    axios.get(`/search.json?term=${term}`)
      .then(response => {
        this.setState({ term, results: response.data })
      })
  }

  render(){
    const { term, results } = this.state
    return(
      <React.Fragment>
        <label htmlFor="term">Search</label>
        <input
          type="search"
          name='term'
          value={term}
          autoComplete="off"
          onChange={this.handleChange}
        />
        { results.length > 0 && term.length > 0 &&
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
