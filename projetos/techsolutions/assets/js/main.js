// Dashboard interativo
document.addEventListener('DOMContentLoaded', function() {
    // Simulação de gráfico (em produção usaria Chart.js ou similar)
    const canvas = document.getElementById('salesChart');
    if (canvas) {
        const ctx = canvas.getContext('2d');
        canvas.width = canvas.parentElement.offsetWidth;
        canvas.height = 250;
        
        // Desenhar gráfico simples
        ctx.strokeStyle = '#0066cc';
        ctx.lineWidth = 3;
        ctx.beginPath();
        ctx.moveTo(0, 200);
        ctx.lineTo(50, 180);
        ctx.lineTo(100, 160);
        ctx.lineTo(150, 140);
        ctx.lineTo(200, 120);
        ctx.lineTo(250, 100);
        ctx.stroke();
    }
});

