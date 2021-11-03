enum Planet {
    Earth
    Mars
    Jupiter
    Pluto
}

class person {
    static [string]$Galaxy = "Milky Way"
    hidden [string]$species = "Cephalopod"
    [string]$Name
    [int32]$Age
    [Planet]$Planet
    [string]$Universe = "Milky Way"


    #[string]$PlanetLocation = [person]::Galaxy

    [string] Dispute() {
        return "I don't think you're a real person"
    }

    [void] Correct() {
        if ($this.Age -gt 100) {
            $this.Age = $this.Age / 10
        }
    }

    [int] MakeMeYounger([int]$YearsToSubtract) {
        $this.Age = $this.Age - $YearsToSubtract
        return $this.Age
    }

    [int] MakeMeYounger() {
        $this.Age = $this.Age - 1
        return $this.Age
    }

    [string] SaySomething($something) {
        return "$something!!!"
    }

    [string] SaySomething() {
        return $this.SaySomething("Snarky")
    }

    static [string] Testing() {
        return "Static methods FTW!"
    }

    person () {}
    
    person ([string]$Name, [int]$Age) {
        $this.Name = $Name
        $this.Age = $Age
    }

    person ([string]$Name, [int]$Age, [Planet]$Planet) {
        $this.Name = $Name
        $this.Age = $Age
        $this.Planet = $Planet
    }

    person ([string]$Name, [int]$Age, [Planet]$Planet, [string]$Universe) {
        $this.Name = $Name
        $this.Age = $Age
        $this.Planet = $Planet
        $this.Universe = $Universe
    }
}