// ===== TIRO ACERTA BOSS =====

if (!invulneravel && !other.ja_acertou) {
    
    hp_boss -= 1;
    
    image_blend = c_white;
    alarm[1] = 5;
    
    other.ja_acertou = true;
    
    with(other) {
        instance_destroy();
    }
}