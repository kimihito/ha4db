// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

// eslint-disable-next-line @typescript-eslint/no-unused-vars
import * as React from 'react'
import * as ReactDOM from 'react-dom'
import * as PropTypes from 'prop-types'

const Hello = props => (
  <div>Hello {props.name}!</div>
)

Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

const TestButton = props => (
  <button className="mdc-button foo-button">
    <div className="mdc-button__ripple"></div>
    <span className="mdc-button__label">{props.name}</span>
  </button>
)

TestButton.defaultProps = {
  name: 'Button'
}

TestButton.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <TestButton name="React" />,
    document.body.appendChild(document.createElement('div')),
  )
})
