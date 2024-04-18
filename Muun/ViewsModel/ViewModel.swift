//
//  ViewModel.swift
//  Muun
//
//  Created by Fernando Rivera Castillo on 25/11/23.
//

import Foundation
import SwiftData

@Observable
final class ViewModel: ObservableObject {
    let container = try! ModelContainer(for: MomData.self, BabyData.self)
    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }
    var moms:[MomData]=[]
    @MainActor
    func getmoms() {
        let fetchDescriptor = FetchDescriptor<MomData>(predicate: nil)
        do {
            let moms = try modelContext.fetch(fetchDescriptor)
            for mom in moms {
                if let babyName = mom.baby?.name {
                    print("Nombre del bebé: \(babyName)")
                }
            }
        } catch {
            print("Error al obtener madres: \(error)")
        }
    }
    
    
    @MainActor
    func createMom(name: String, username: String, password: String, CorreoUser: String, profileImageName: String) -> Result<UUID, Error> {
        let newMom = MomData(id: UUID(), name: name, username: username, baby: nil, profileImageName: profileImageName, CorreoUser: CorreoUser, password: password)
        modelContext.insert(newMom)
        do {
            try modelContext.save()
            moms=[]
            getmoms()
            return .success(newMom.id) // Devolver el ID de la nueva madre
        } catch {
            return .failure(error)
        }
    }
    
    @MainActor
    func getMomById(momId: UUID) -> MomData? {
        let momPredicate = #Predicate<MomData> {
            $0.id == momId
        }
        let fetchDescriptor = FetchDescriptor<MomData>(predicate: momPredicate)
        do {
            let moms = try modelContext.fetch(fetchDescriptor)
            return moms.first
        } catch {
            print("Error al obtener madre por ID: \(error)")
            return nil
        }
    }

    @MainActor
    func addBabyToMom(momId: UUID, baby: BabyData) -> Result<UUID, Error> {
        if let mom = getMomById(momId: momId) {
            mom.baby = baby
            do {
                try modelContext.save()
                return .success(momId) // Devolver el ID de la madre
            } catch {
                return .failure(error)
            }
        } else {
            return .failure(NSError(domain: "MomData", code: 404, userInfo: [NSLocalizedDescriptionKey: "Madre no encontrada"]))
        }
    }


    @MainActor
    func deleteAllMoms(){
        moms.forEach{
            modelContext.delete($0)
        }
        moms=[]
        getmoms()
    }
    
    @MainActor
    func getMomByUsernameAndPassword(username: String, password: String) -> Result<MomData, Error> {
        let predicate = #Predicate<MomData> {
            $0.username == username && $0.password == password
        }
        let fetchDescriptor = FetchDescriptor<MomData>(predicate: predicate)

        do {
            let moms = try modelContext.fetch(fetchDescriptor)
            if let mom = moms.first {
                return .success(mom)
            } else {
                return .failure(NSError(domain: "MomData", code: 404, userInfo: [NSLocalizedDescriptionKey: "Usuario no encontrado o contraseña incorrecta"]))
            }
        } catch {
            return .failure(error)
        }
    }
}
