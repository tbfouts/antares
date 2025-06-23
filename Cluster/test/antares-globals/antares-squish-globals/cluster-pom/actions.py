


class Cluster_Actions():
    
    @staticmethod
    def get_speed() -> str:
        return str(Cluster.objects.speedometerComponent().txtMPHvalueFRText)
    
    
    @staticmethod
    def get_rpm() -> str:
        return str(Cluster.objects.rpmGaugeComponent().txtRPMValueFRText)
