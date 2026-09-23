export interface Lantern {
    fname: string,
    lname?: string,
    corps?: "Green" | "Blue"| "Blood Garnet" | "Red",
    powerLevel: number
}

export interface LanternHomeWorld extends Lantern {
    homeWorld: string | undefined | null | number
}