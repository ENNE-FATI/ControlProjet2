package mapper;

public class ActiviteLieuCount {
    private String lieuName;
    private long reservationCount;

    // Constructeur
    public ActiviteLieuCount(String lieuName, long reservationCount) {
        this.lieuName = lieuName;
        this.reservationCount = reservationCount;
    }

    // Getters (nécessaires pour Gson)
    public String getLieuName() { return lieuName; }
    public long getReservationCount() { return reservationCount; }
}