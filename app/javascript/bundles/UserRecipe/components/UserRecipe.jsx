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
    event.preventDefault()
    event.stopPropagation()
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
    const { inUserRecipe } = this.props;
    const removeText = inUserRecipe ? '- Remove' : '- Remove from Cookbook'
    const addText = inUserRecipe ? '+ Add' : '+ Add to Cookbook'
    return(
      <button
        onClick={this.handleClick}
        className={this.props.className}
      >
        { inCookbook ? removeText : addText }
      </button>
    )
  }
}

export default UserRecipe
