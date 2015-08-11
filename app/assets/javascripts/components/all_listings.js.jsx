var AllListings = React.createClass({

  getInitialState: function() {
    return { listings: [] };
  },

  componentDidMount: function() {
    this._getListings();
    this._interval = setInterval(this._getListings, 1000);
  },

  componentWillUnmount: function() {
    clearInterval(this._interval);
  },
  
  _getListings: function() {
    $.ajax({
      url: 'api/products_and_posts_conditional',
      dataType: 'json',
      type: 'GET',
      success: function(response) {
        this.setState({listings: response});
      }.bind(this),
      error: function(error) {
        console.log(error);
      }
    });
  },

  _renderListings: function() {
    return this.state.listings.map( function(listing) {
      if (listing.title) {
        return <Post post={listing}/>;
      }
      else {
        return <Product product={listing}/>;
      }
    });
  },

  render: function() {
    return(
      <div>
        {this._renderListings()}
      </div>
    );
  }
});