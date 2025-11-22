
// ARQUIVO GERADO AUTOMATICAMENTE
extern "C" void main_prog();
extern "C" float RESULTS_HISTORY[6];
extern "C" float MEM_STORAGE;
void setup() { Serial.begin(9600); while(!Serial); Serial.println("--- INICIANDO EXECUCAO ASSEMBLY ---"); unsigned long t1 = micros(); main_prog(); unsigned long t2 = micros(); Serial.print("Tempo: "); Serial.print(t2-t1); Serial.println(" us"); Serial.println("\n--- RESULTADOS ---"); for(int i=0; i < 6; i++) { Serial.print("L"); Serial.print(i+1); Serial.print(": "); Serial.println(RESULTS_HISTORY[i], 4); } }
void loop() { }
