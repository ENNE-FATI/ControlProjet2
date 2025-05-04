<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Statistiques par lieu</title>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    #chart-container { width: 80%; margin: 0 auto; }
    .error { color: red; }
  </style>
</head>
<body>

<h1>Réservations par lieu d'activité</h1>
<div id="chart-container">
  <canvas id="reservationChart"></canvas>
</div>

<script>
document.addEventListener('DOMContentLoaded', async () => {
  const ctx = document.getElementById('reservationChart');
  
  try {
    const response = await fetch('http://localhost:8080/ControlProjet2/ActiviteLieuController');
    
    if (!response.ok) {
      throw new Error(`Erreur ${response.status}: ${response.statusText}`);
    }
    
    const data = await response.json();
    console.log("Données reçues:", data);
    
    if (data.length === 0) {
      document.getElementById('chart-container').innerHTML = 
        '<p class="error">Aucune donnée disponible</p>';
      return;
    }
    
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: data.map(item => item.lieuName),
        datasets: [{
          label: 'Nombre de réservations',
          data: data.map(item => item.reservationCount),
          backgroundColor: [
            'rgba(255, 99, 132, 0.7)',
            'rgba(54, 162, 235, 0.7)',
            'rgba(255, 206, 86, 0.7)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
            ticks: {
              stepSize: 1
            }
          }
        }
      }
    });
    
  } catch (error) {
    console.error("Erreur:", error);
    document.getElementById('chart-container').innerHTML = 
      `<p class="error">${error.message}</p>`;
  }
});
</script>

</body>
</html>