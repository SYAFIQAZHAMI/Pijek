import React, { useState, useEffect } from 'react';
import { createRoot } from 'react-dom/client';
import { BrowserRouter, Routes, Route, Link, useLocation } from 'react-router-dom';
import { LayoutDashboard, Users, Car, Store, ShoppingBag, Settings, LogOut, Zap } from 'lucide-react';
import axios from 'axios';

// --- Components ---

const Sidebar = () => {
    const location = useLocation();
    
    const navItems = [
        { path: '/', icon: <LayoutDashboard size={20} />, label: 'Dashboard' },
        { path: '/users', icon: <Users size={20} />, label: 'Users' },
        { path: '/drivers', icon: <Car size={20} />, label: 'Drivers' },
        { path: '/merchants', icon: <Store size={20} />, label: 'Merchants' },
        { path: '/orders', icon: <ShoppingBag size={20} />, label: 'Orders' },
        { path: '/settings', icon: <Settings size={20} />, label: 'Settings' },
    ];

    return (
        <aside className="sidebar">
            <div className="brand">
                <div className="brand-icon">
                    <Zap size={24} />
                </div>
                <span>PIJEK</span>
            </div>
            
            <nav className="nav-links">
                {navItems.map((item) => (
                    <Link 
                        key={item.path} 
                        to={item.path} 
                        className={`nav-item ${location.pathname === item.path ? 'active' : ''}`}
                    >
                        {item.icon}
                        <span>{item.label}</span>
                    </Link>
                ))}
            </nav>

            <div style={{ marginTop: 'auto' }}>
                <button className="nav-item" style={{ width: '100%', border: 'none', background: 'transparent', cursor: 'pointer' }}>
                    <LogOut size={20} />
                    <span>Logout</span>
                </button>
            </div>
        </aside>
    );
};

const DashboardHome = () => {
    const [stats, setStats] = useState({ total_orders: 0, active_drivers: 0, total_merchants: 0 });

    useEffect(() => {
        // Mock fetch stats - in reality we would hit /api/admin/dashboard-stats
        setStats({
            total_orders: 1248,
            active_drivers: 86,
            total_merchants: 142
        });
    }, []);

    return (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '32px' }}>
            <div>
                <h1><span className="gradient-text">Welcome back,</span> Admin</h1>
                <p style={{ color: 'var(--text-muted)', marginTop: '8px' }}>Here is what's happening with PIJEK today.</p>
            </div>

            <div className="stats-grid">
                <div className="glass-panel stat-card">
                    <div className="stat-header">
                        <span>Total Orders</span>
                        <div className="stat-icon"><ShoppingBag size={24} /></div>
                    </div>
                    <div className="stat-value">{stats.total_orders}</div>
                    <div style={{ color: 'var(--success)', fontSize: '13px', fontWeight: '500' }}>+12% from yesterday</div>
                </div>

                <div className="glass-panel stat-card">
                    <div className="stat-header">
                        <span>Active Drivers</span>
                        <div className="stat-icon"><Car size={24} /></div>
                    </div>
                    <div className="stat-value">{stats.active_drivers}</div>
                    <div style={{ color: 'var(--success)', fontSize: '13px', fontWeight: '500' }}>Ready for orders</div>
                </div>

                <div className="glass-panel stat-card">
                    <div className="stat-header">
                        <span>Total Merchants</span>
                        <div className="stat-icon"><Store size={24} /></div>
                    </div>
                    <div className="stat-value">{stats.total_merchants}</div>
                    <div style={{ color: 'var(--primary-color)', fontSize: '13px', fontWeight: '500' }}>+3 new today</div>
                </div>
            </div>

            <div className="glass-panel">
                <h3 style={{ marginBottom: '24px' }}>Recent Orders</h3>
                <div className="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Service</th>
                                <th>Customer</th>
                                <th>Price</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            {[
                                { id: '#ORD-001', service: 'Pijek Ride', user: 'Budi Santoso', price: 'Rp 15.000', status: 'completed' },
                                { id: '#ORD-002', service: 'Pijek Food', user: 'Ayu Lestari', price: 'Rp 45.000', status: 'on_delivery' },
                                { id: '#ORD-003', service: 'Pijek Send', user: 'Joko Widodo', price: 'Rp 20.000', status: 'picking_up' },
                                { id: '#ORD-004', service: 'Pijek Car', user: 'Siti Aminah', price: 'Rp 35.000', status: 'pending' },
                            ].map((row, i) => (
                                <tr key={i}>
                                    <td style={{ fontWeight: '600' }}>{row.id}</td>
                                    <td>
                                        <span className={`badge ${row.service.includes('Ride') ? 'badge-primary' : row.service.includes('Food') ? 'badge-warning' : 'badge-success'}`}>
                                            {row.service}
                                        </span>
                                    </td>
                                    <td>{row.user}</td>
                                    <td style={{ fontWeight: '600' }}>{row.price}</td>
                                    <td>
                                        <span className={`badge ${row.status === 'completed' ? 'badge-success' : row.status === 'pending' ? 'badge-warning' : 'badge-primary'}`}>
                                            {row.status.replace('_', ' ')}
                                        </span>
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
};

const PlaceholderPage = ({ title }) => (
    <div className="glass-panel" style={{ minHeight: '400px', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
        <div style={{ textAlign: 'center' }}>
            <h2 className="gradient-text" style={{ fontSize: '32px', marginBottom: '16px' }}>{title}</h2>
            <p style={{ color: 'var(--text-muted)' }}>This module is currently under development.</p>
        </div>
    </div>
);

const App = () => {
    return (
        <BrowserRouter>
            <div className="app-container">
                <Sidebar />
                <main className="main-content">
                    <Routes>
                        <Route path="/" element={<DashboardHome />} />
                        <Route path="/users" element={<PlaceholderPage title="User Management" />} />
                        <Route path="/drivers" element={<PlaceholderPage title="Driver Management" />} />
                        <Route path="/merchants" element={<PlaceholderPage title="Merchant Management" />} />
                        <Route path="/orders" element={<PlaceholderPage title="Order Management" />} />
                        <Route path="/settings" element={<PlaceholderPage title="System Settings" />} />
                    </Routes>
                </main>
            </div>
        </BrowserRouter>
    );
};

const root = createRoot(document.getElementById('root'));
root.render(<App />);
