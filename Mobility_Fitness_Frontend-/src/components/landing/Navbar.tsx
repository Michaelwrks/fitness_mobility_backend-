import Button from "react-bootstrap/Button";
import Container from "react-bootstrap/Container";
import Form from "react-bootstrap/Form";
import Nav from "react-bootstrap/Nav";
import Navbar from "react-bootstrap/Navbar";
import NavDropdown from "react-bootstrap/NavDropdown";

function NavScrollExample() {
	return (
		<nav className="navbar">
			<ul>
				<li>
					<a href="">Home</a>
				</li>
				<li>
					<a href="">About</a>
				</li>
				<li>
					<a href="">Products</a>
				</li>
				<li>
					<a href="">Contact</a>
				</li>
			</ul>

		</nav>
	);
}

export default NavScrollExample;
