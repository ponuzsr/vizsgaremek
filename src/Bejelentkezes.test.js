
import { render, screen } from '@testing-library/react';
import Bejelentkezes from './Bejelentkezes';
import { useNavigate,Route } from 'react-router-dom'
test('login form validation', async () => {
    render(<Bejelentkezes/>);
    
    fireEvent.click(screen.getByText("Bejelentkezés"));
    expect(screen.getByText("Töltse ki ezt a mezőt.")).toBeInTheDocument();
    fireEvent.change(screen.getByTestId("Email"), { target: { value: "invalid@example.com" }
    });
    fireEvent.change(screen.getByTestId("Password"), { target: { value: "wrongpassword" } });
    fireEvent.click(screen.getByText("Bejelentkezés"));
    expect(await screen.findByText("Töltse ki ezt a mezőt.")).toBeInTheDocument();
    });