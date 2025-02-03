import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

function Bejelentkezes() {
  //teszt kód!
  const [formData, setFormData] = useState({
    username: "",
    email: "",
    password: "",
  });
  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState(null);
  const navigate = useNavigate();

  // 📌 Input változáskezelő
  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const validate = () => {
    let errors = {};

    if (!formData.username.trim())
      errors.username = "A felhasználónév kötelező!";
    if (!formData.email) errors.email = "Az email megadása kötelező!";
    else if (!/\S+@\S+\.\S+/.test(formData.email))
      errors.email = "Érvénytelen email formátum!";
    if (!formData.password) errors.password = "A jelszó megadása kötelező!";
    else if (formData.password.length < 6)
      errors.password =
        "A jelszónak legalább 6 karakter hosszúnak kell lennie!";

    setErrors(errors);
    return Object.keys(errors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validate()) return;

    setLoading(true);
    try {
        // axios ide majd
      setMessage({ type: "success", text: "Sikeres bejelentkezés!" });
      setTimeout(() => navigate("/"), 1500);
    } catch (error) {
      setMessage({ type: "error", text: "Hibás felhasználónév vagy jelszó!" });
    }
    setLoading(false);
  };

  return (
    <div className="login-container">
      <h2>Bejelentkezés</h2>
      {message && <p className={`message ${message.type}`}>{message.text}</p>}

      <form onSubmit={handleSubmit}>
        <div className="input-group">
          <input
            type="text"
            name="username"
            placeholder="Felhasználónév"
            value={formData.username}
            onChange={handleChange}
          />
          {errors.username && <p className="error-text">{errors.username}</p>}
        </div>

        <div className="input-group">
          <input
            type="email"
            name="email"
            placeholder="Email"
            value={formData.email}
            onChange={handleChange}
          />
          {errors.email && <p className="error-text">{errors.email}</p>}
        </div>

        <div className="input-group">
          <input
            type="password"
            name="password"
            placeholder="Jelszó"
            value={formData.password}
            onChange={handleChange}
          />
          {errors.password && <p className="error-text">{errors.password}</p>}
        </div>

        <button className="login-btn" type="submit" disabled={loading}>
          {loading ? "Bejelentkezés..." : "Bejelentkezés"}
        </button>
      </form>
    </div>
  );
}

export default Bejelentkezes;
