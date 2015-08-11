var Product = React.createClass({
  render: function() {
    return(
      <div>
        <h3> Product: {this.props.product.name} </h3>
        <small> {this.props.product.price} </small>
      </div>
    );
  }
});