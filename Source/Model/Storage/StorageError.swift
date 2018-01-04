import Foundation

enum StorageError:Error
{
    case saveFailed
    case loadFailed
    case fileNotFound
    case deleteFailed
}
