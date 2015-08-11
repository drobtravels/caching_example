var Post = React.createClass({
  render: function() {
    return(
      <h3> Post: {this.props.post.title} </h3>
    );
  }
});