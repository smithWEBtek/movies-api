import React, { Component } from 'react'
import * as actions from '../store/actions/index'
import { connect } from 'react-redux';

class Genres extends Component {
	state = {
		genres: []
	}

	componentDidMount() {
		this.props.onFetchGenres()
		console.log(this.props);
	}

	render() {
		// const { genres } = this.props
		let renderedGenres = this.props.genres.map((genre, index) => {
			return (
				<div key={index}>
					{genre.title}
				</div>
			)
		})

		return (
			<div>
				{renderedGenres}
			</div>
		)

	}
}

const mapStateToProps = state => {
	return {
		genres: state.gen.genres
	}
}

const mapDispatchToProps = dispatch => {
	return {
		onFetchGenres: () => dispatch(actions.fetchGenres())
	}
}


export default connect(mapStateToProps, mapDispatchToProps)(Genres)
