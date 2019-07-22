//
//  ViewController.swift
//  TrisApp
//
//  Created by Federico Barbieri on 21/05/18.
//  Copyright © 2018 Federico Barbieri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var casella1Container: UIView!
    @IBOutlet weak var casella2Comntainer: UIView!
    @IBOutlet weak var casella3Container: UIView!
    @IBOutlet weak var casella4Container: UIView!
    @IBOutlet weak var casella5Container: UIView!
    @IBOutlet weak var casella6Container: UIView!
    @IBOutlet weak var casella7Container: UIView!
    @IBOutlet weak var casella8Container: UIView!
    @IBOutlet weak var casella9Container: UIView!
    
    var casella1 : Casella = Casella()
    var casella2 : Casella = Casella()
    var casella3 : Casella = Casella()
    var casella4 : Casella = Casella()
    var casella5 : Casella = Casella()
    var casella6 : Casella = Casella()
    var casella7 : Casella = Casella()
    var casella8 : Casella = Casella()
    var casella9 : Casella = Casella()
    
    
    @IBAction func nuovaPartitaButtonPressed(_ sender: Any) {
        
        self.iniziaNuovPartita()
    }
    
    enum turno: Int {
        
        case x = 1
        case o = 2
        
    }
    
    var turno : turno = .x
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareView()
    }
    
    func prepareView(){
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella1Container.addSubview(casellaToAdd)
            self.casella1 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella1Pressed(_:)))
            casella1.addGestureRecognizer(tap)
        }
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella2Comntainer.addSubview(casellaToAdd)
            self.casella2 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella2Pressed(_:)))
            casella2.addGestureRecognizer(tap)
        }
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella3Container.addSubview(casellaToAdd)
            self.casella3 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella3Pressed(_:)))
            casella3.addGestureRecognizer(tap)
        }
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella4Container.addSubview(casellaToAdd)
            self.casella4 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella4Pressed(_:)))
            casella4.addGestureRecognizer(tap)
        }
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella5Container.addSubview(casellaToAdd)
            self.casella5 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella5Pressed(_:)))
            casella5.addGestureRecognizer(tap)
        }
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella6Container.addSubview(casellaToAdd)
            self.casella6 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella6Pressed(_:)))
            casella6.addGestureRecognizer(tap)
        }
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella7Container.addSubview(casellaToAdd)
            self.casella7 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella7Pressed(_:)))
            casella7.addGestureRecognizer(tap)
        }
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella8Container.addSubview(casellaToAdd)
            self.casella8 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella8Pressed(_:)))
            casella8.addGestureRecognizer(tap)
        }
        
        if let casellaToAdd = Bundle.main.loadNibNamed("Casella", owner: nil, options: nil)!.first as? Casella {
            
            casellaToAdd.prepareCasella()
            
            self.casella9Container.addSubview(casellaToAdd)
            self.casella9 = casellaToAdd
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.casella9Pressed(_:)))
            casella9.addGestureRecognizer(tap)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cambiaTurno() {
        
        if(self.turno == .x){
            
            self.turno = .o
        }
        else{
            
            self.turno = .x
        }
    }
    
    func getTurno() -> turno {
        
        return self.turno
    }
    
    func controllaVittoria(){
        
        self.controllaVittoriaNeri()
        self.controllaVittoriaVerdi()
        
    }
    
    func controllaVittoriaNeri(){
        
        if(self.casella1.getStato() == .x && self.casella2.getStato() == .x && self.casella3.getStato() == .x){
            
            self.notificaVittoriaNeri()
        }
        else if(self.casella4.getStato() == .x && self.casella5.getStato() == .x && self.casella6.getStato() == .x){
            
            self.notificaVittoriaNeri()
        }
        else if(self.casella7.getStato() == .x && self.casella8.getStato() == .x && self.casella9.getStato() == .x){
            
            self.notificaVittoriaNeri()
        }
        else if(self.casella1.getStato() == .x && self.casella4.getStato() == .x && self.casella7.getStato() == .x){
            
            self.notificaVittoriaNeri()
        }
        else if(self.casella2.getStato() == .x && self.casella5.getStato() == .x && self.casella8.getStato() == .x){
            
            self.notificaVittoriaNeri()
        }
        else if(self.casella3.getStato() == .x && self.casella6.getStato() == .x && self.casella9.getStato() == .x){
            
            self.notificaVittoriaNeri()
        }
        else if(self.casella1.getStato() == .x && self.casella5.getStato() == .x && self.casella9.getStato() == .x){
            
            self.notificaVittoriaNeri()
        }
        else if(self.casella3.getStato() == .x && self.casella5.getStato() == .x && self.casella7.getStato() == .x){
            
            self.notificaVittoriaNeri()
        }
    }
    
    func controllaVittoriaVerdi(){
        
        if(self.casella1.getStato() == .o && self.casella2.getStato() == .o && self.casella3.getStato() == .o){
            
            self.notificaVittoriaVerdi()
        }
        else if(self.casella4.getStato() == .o && self.casella5.getStato() == .o && self.casella6.getStato() == .o){
            
            self.notificaVittoriaVerdi()
        }
        else if(self.casella7.getStato() == .o && self.casella8.getStato() == .o && self.casella9.getStato() == .o){
            
            self.notificaVittoriaVerdi()
        }
        else if(self.casella1.getStato() == .o && self.casella4.getStato() == .o && self.casella7.getStato() == .o){
            
            self.notificaVittoriaVerdi()
        }
        else if(self.casella2.getStato() == .o && self.casella5.getStato() == .o && self.casella8.getStato() == .o){
            
            self.notificaVittoriaVerdi()
        }
        else if(self.casella3.getStato() == .o && self.casella6.getStato() == .o && self.casella9.getStato() == .o){
            
            self.notificaVittoriaVerdi()
        }
        else if(self.casella1.getStato() == .o && self.casella5.getStato() == .o && self.casella9.getStato() == .o){
            
            self.notificaVittoriaVerdi()
        }
        else if(self.casella3.getStato() == .o && self.casella5.getStato() == .o && self.casella7.getStato() == .o){
            
            self.notificaVittoriaVerdi()
        }
        
    }
    
    func notificaVittoriaNeri(){
        
        let alert = UIAlertController(title: "Tris", message: "I NERI hanno vinto", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            
            action in
            
            self.iniziaNuovPartita()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func notificaVittoriaVerdi(){
        
        let alert = UIAlertController(title: "Tris", message: "I VERDI hanno vinto", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            
            action in
            
            self.iniziaNuovPartita()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func iniziaNuovPartita(){
        
        self.prepareView()
    }
}

extension ViewController : UIGestureRecognizerDelegate {
    
    @objc func casella1Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 1 pressed")
        
        guard self.casella1.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella1.setStato(stato: .x)
        }
        else{
            
            self.casella1.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
    }
    
    @objc func casella2Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 2 pressed")
        
        guard self.casella2.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella2.setStato(stato: .x)
        }
        else{
            
            self.casella2.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
    }
    
    @objc func casella3Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 3 pressed")
        
        guard self.casella3.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella3.setStato(stato: .x)
        }
        else{
            
            self.casella3.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
        
    }
    @objc func casella4Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 4 pressed")
        
        guard self.casella4.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella4.setStato(stato: .x)
        }
        else{
            
            self.casella4.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
        
    }
    @objc func casella5Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 5 pressed")
        
        guard self.casella5.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella5.setStato(stato: .x)
        }
        else{
            
            self.casella5.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
        
    }
    @objc func casella6Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 6 pressed")
        
        guard self.casella6.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella6.setStato(stato: .x)
        }
        else{
            
            self.casella6.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
        
    }
    @objc func casella7Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 7 pressed")
        
        guard self.casella7.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella7.setStato(stato: .x)
        }
        else{
            
            self.casella7.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
        
    }
    @objc func casella8Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 8 pressed")
        
        guard self.casella8.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella8.setStato(stato: .x)
        }
        else{
            
            self.casella8.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
        
    }
    @objc func casella9Pressed(_ sender: UITapGestureRecognizer) {
        
        print("Casella 9 pressed")
        
        guard self.casella9.getStato() == .undefine else {
            
            return
        }
        
        if(self.getTurno() == .x){
            
            self.casella9.setStato(stato: .x)
        }
        else{
            
            self.casella9.setStato(stato: .o)
        }
        
        self.cambiaTurno()
        self.controllaVittoria()
        
    }
}

