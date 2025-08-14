import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "./index.css";
import Home from "./pages/Home";
import App from "./App.tsx";
import { error } from "console";

const router = createBrowserRouter([
	{
		path: "/",
		element: <Home />,
		errorElement: <div>Something went wrong!</div>,
	},
]);

createRoot(document.getElementById("root")!).render(
	<StrictMode>
		<RouterProvider router={router} />
	</StrictMode>
);
