import React, { Component } from 'react'
import axios from 'axios'
import ReactOnRails from 'react-on-rails';

const csrfHeaders = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-Token': ReactOnRails.authenticityToken()
}

class UserRecipe extends Component {
  state = { inCookbook: this.props.inCookbook }

  handleClick = event => {
    if(this.state.inCookbook){
      axios.delete(`/recipes/${this.props.recipe.id}/user_recipe.json`, { headers: csrfHeaders })
        .then(response => this.setState({ inCookbook: false }))
    }else{
      axios.post(`/recipes/${this.props.recipe.id}/user_recipe.json`, {}, { headers: csrfHeaders })
        .then(response => this.setState({ inCookbook: true }))
    }
  }

  render(){
    const { inCookbook } = this.state
    return(
      <button
        onClick={this.handleClick}
        className={this.props.className}
      >
        { inCookbook ? 'Remove' : 'Add' }
      </button>
    )
  }
}

export default UserRecipe
