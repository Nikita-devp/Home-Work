// DZ !

enum seasons {
    case winter
    case autumn
    case summer
    case spring
}

func season(wich mounth: Int) -> seasons? {
    switch mounth {
    case 12,1,2:
        return .winter
    case 3,4,5:
        return .spring
    case 6,7,8:
        return .summer
    case 9,10,11:
        return .autumn
    default:
        return nil
    }
    
}

season(wich: 6)

// был очень загруженый график не успел с конспектом и задачей 3 
