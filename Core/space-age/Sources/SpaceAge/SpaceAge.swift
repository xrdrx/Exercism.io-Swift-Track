//Solution goes in Sources
struct SpaceAge {
    let seconds: Double
    var onEarth: Double {
        return seconds / OrbitalPeriods.earthInSeconds
    }
    var onMercury: Double {
        return onEarth / OrbitalPeriods.mercuryInEarthYears
    }
    var onVenus: Double {
        return onEarth / OrbitalPeriods.venusInEarthYears
    }
    var onMars: Double {
        return onEarth / OrbitalPeriods.marsInEarthYears
    }
    var onJupiter: Double {
        return onEarth / OrbitalPeriods.jupiterInEarthYears
    }
    var onSaturn: Double {
        return onEarth / OrbitalPeriods.saturnInEarthYears
    }
    var onUranus: Double {
        return onEarth / OrbitalPeriods.uranusInEarthYears
    }
    var onNeptune: Double {
        return onEarth / OrbitalPeriods.neptuneInEarthYears
    }
    
    init(_ seconds: Double) {
        self.seconds = seconds
    }
}

enum OrbitalPeriods {
    static let earthInSeconds      = 31557600.0
    static let mercuryInEarthYears = 0.2408467
    static let venusInEarthYears   = 0.61519726
    static let marsInEarthYears    = 1.8808158
    static let jupiterInEarthYears = 11.862615
    static let saturnInEarthYears  = 29.447498
    static let uranusInEarthYears  = 84.016846
    static let neptuneInEarthYears = 164.79132
}
