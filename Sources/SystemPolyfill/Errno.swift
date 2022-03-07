#if canImport(System)
import System
#endif

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

public struct Errno: Error {
    private struct PolyfilledErrno: Error {
        var _domain: String { "NSPOSIXErrorDomain" }
        let _code: Int
    }

    private static func makeFromRawValue(_ rawValue: Int32) -> Error {
        if #available(macOS 11.0, macCatalyst 14.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *) {
            return System.Errno(rawValue: rawValue)
        } else {
            return PolyfilledErrno(_code: Int(rawValue))
        }
    }

    public static var notPermitted: Error { self.makeFromRawValue(EPERM) }
    public static var noSuchFileOrDirectory: Error { self.makeFromRawValue(ENOENT) }
    public static var noSuchProcess: Error { self.makeFromRawValue(ESRCH) }
    public static var interrupted: Error { self.makeFromRawValue(EINTR) }
    public static var ioError: Error { self.makeFromRawValue(EIO) }
    public static var noSuchAddressOrDevice: Error { self.makeFromRawValue(ENXIO) }
    public static var argListTooLong: Error { self.makeFromRawValue(E2BIG) }
    public static var execFormatError: Error { self.makeFromRawValue(ENOEXEC) }
    public static var badFileDescriptor: Error { self.makeFromRawValue(EBADF) }
    public static var noChildProcess: Error { self.makeFromRawValue(ECHILD) }
    public static var deadlock: Error { self.makeFromRawValue(EDEADLK) }
    public static var noMemory: Error { self.makeFromRawValue(ENOMEM) }
    public static var permissionDenied: Error { self.makeFromRawValue(EACCES) }
    public static var badAddress: Error { self.makeFromRawValue(EFAULT) }
    public static var notBlockDevice: Error { self.makeFromRawValue(ENOTBLK) }
    public static var resourceBusy: Error { self.makeFromRawValue(EBUSY) }
    public static var fileExists: Error { self.makeFromRawValue(EEXIST) }
    public static var improperLink: Error { self.makeFromRawValue(EXDEV) }
    public static var operationNotSupportedByDevice: Error { self.makeFromRawValue(ENODEV) }
    public static var notDirectory: Error { self.makeFromRawValue(ENOTDIR) }
    public static var isDirectory: Error { self.makeFromRawValue(EISDIR) }
    public static var invalidArgument: Error { self.makeFromRawValue(EINVAL) }
    public static var tooManyOpenFilesInSystem: Error { self.makeFromRawValue(ENFILE) }
    public static var tooManyOpenFiles: Error { self.makeFromRawValue(EMFILE) }
    public static var inappropriateIOCTLForDevice: Error { self.makeFromRawValue(ENOTTY) }
    public static var textFileBusy: Error { self.makeFromRawValue(ETXTBSY) }
    public static var fileTooLarge: Error { self.makeFromRawValue(EFBIG) }
    public static var noSpace: Error { self.makeFromRawValue(ENOSPC) }
    public static var illegalSeek: Error { self.makeFromRawValue(ESPIPE) }
    public static var readOnlyFileSystem: Error { self.makeFromRawValue(EROFS) }
    public static var tooManyLinks: Error { self.makeFromRawValue(EMLINK) }
    public static var brokenPipe: Error { self.makeFromRawValue(EPIPE) }
    public static var outOfDomain: Error { self.makeFromRawValue(EDOM) }
    public static var outOfRange: Error { self.makeFromRawValue(ERANGE) }
    public static var resourceTemporarilyUnavailable: Error { self.makeFromRawValue(EAGAIN) }
    public static var nowInProgress: Error { self.makeFromRawValue(EINPROGRESS) }
    public static var alreadyInProcess: Error { self.makeFromRawValue(EALREADY) }
    public static var notSocket: Error { self.makeFromRawValue(ENOTSOCK) }
    public static var addressRequired: Error { self.makeFromRawValue(EDESTADDRREQ) }
    public static var messageTooLong: Error { self.makeFromRawValue(EMSGSIZE) }
    public static var protocolWrongTypeForSocket: Error { self.makeFromRawValue(EPROTOTYPE) }
    public static var protocolNotAvailable: Error { self.makeFromRawValue(ENOPROTOOPT) }
    public static var protocolNotSupported: Error { self.makeFromRawValue(EPROTONOSUPPORT) }
    public static var socketTypeNotSupported: Error { self.makeFromRawValue(ESOCKTNOSUPPORT) }
    public static var notSupported: Error { self.makeFromRawValue(ENOTSUP) }
    public static var protocolFamilyNotSupported: Error { self.makeFromRawValue(EPFNOSUPPORT) }
    public static var addressFamilyNotSupported: Error { self.makeFromRawValue(EAFNOSUPPORT) }
    public static var addressInUse: Error { self.makeFromRawValue(EADDRINUSE) }
    public static var addressNotAvailable: Error { self.makeFromRawValue(EADDRNOTAVAIL) }
    public static var networkDown: Error { self.makeFromRawValue(ENETDOWN) }
    public static var networkUnreachable: Error { self.makeFromRawValue(ENETUNREACH) }
    public static var networkReset: Error { self.makeFromRawValue(ENETRESET) }
    public static var connectionAbort: Error { self.makeFromRawValue(ECONNABORTED) }
    public static var connectionReset: Error { self.makeFromRawValue(ECONNRESET) }
    public static var noBufferSpace: Error { self.makeFromRawValue(ENOBUFS) }
    public static var socketIsConnected: Error { self.makeFromRawValue(EISCONN) }
    public static var socketNotConnected: Error { self.makeFromRawValue(ENOTCONN) }
    public static var socketShutdown: Error { self.makeFromRawValue(ESHUTDOWN) }
    public static var timedOut: Error { self.makeFromRawValue(ETIMEDOUT) }
    public static var connectionRefused: Error { self.makeFromRawValue(ECONNREFUSED) }
    public static var tooManySymbolicLinkLevels: Error { self.makeFromRawValue(ELOOP) }
    public static var fileNameTooLong: Error { self.makeFromRawValue(ENAMETOOLONG) }
    public static var hostIsDown: Error { self.makeFromRawValue(EHOSTDOWN) }
    public static var noRouteToHost: Error { self.makeFromRawValue(EHOSTUNREACH) }
    public static var directoryNotEmpty: Error { self.makeFromRawValue(ENOTEMPTY) }
    public static var tooManyProcesses: Error { self.makeFromRawValue(EPROCLIM) }
    public static var tooManyUsers: Error { self.makeFromRawValue(EUSERS) }
    public static var diskQuotaExceeded: Error { self.makeFromRawValue(EDQUOT) }
    public static var staleNFSFileHandle: Error { self.makeFromRawValue(ESTALE) }
    public static var rpcUnsuccessful: Error { self.makeFromRawValue(EBADRPC) }
    public static var rpcVersionMismatch: Error { self.makeFromRawValue(ERPCMISMATCH) }
    public static var rpcProgramUnavailable: Error { self.makeFromRawValue(EPROGUNAVAIL) }
    public static var rpcProgramVersionMismatch: Error { self.makeFromRawValue(EPROGMISMATCH) }
    public static var rpcProcedureUnavailable: Error { self.makeFromRawValue(EPROCUNAVAIL) }
    public static var noLocks: Error { self.makeFromRawValue(ENOLCK) }
    public static var noFunction: Error { self.makeFromRawValue(ENOSYS) }
    public static var badFileTypeOrFormat: Error { self.makeFromRawValue(EFTYPE) }
    public static var authenticationError: Error { self.makeFromRawValue(EAUTH) }
    public static var needAuthenticator: Error { self.makeFromRawValue(ENEEDAUTH) }
    public static var devicePowerIsOff: Error { self.makeFromRawValue(EPWROFF) }
    public static var deviceError: Error { self.makeFromRawValue(EDEVERR) }
    public static var overflow: Error { self.makeFromRawValue(EOVERFLOW) }
    public static var badExecutable: Error { self.makeFromRawValue(EBADEXEC) }
    public static var badCPUType: Error { self.makeFromRawValue(EBADARCH) }
    public static var sharedLibraryVersionMismatch: Error { self.makeFromRawValue(ESHLIBVERS) }
    public static var malformedMachO: Error { self.makeFromRawValue(EBADMACHO) }
    public static var canceled: Error { self.makeFromRawValue(ECANCELED) }
    public static var identifierRemoved: Error { self.makeFromRawValue(EIDRM) }
    public static var noMessage: Error { self.makeFromRawValue(ENOMSG) }
    public static var illegalByteSequence: Error { self.makeFromRawValue(EILSEQ) }
    public static var attributeNotFound: Error { self.makeFromRawValue(ENOATTR) }
    public static var badMessage: Error { self.makeFromRawValue(EBADMSG) }
    public static var multiHop: Error { self.makeFromRawValue(EMULTIHOP) }
    public static var noData: Error { self.makeFromRawValue(ENODATA) }
    public static var noLink: Error { self.makeFromRawValue(ENOLINK) }
    public static var noStreamResources: Error { self.makeFromRawValue(ENOSR) }
    public static var notStream: Error { self.makeFromRawValue(ENOSTR) }
    public static var protocolError: Error { self.makeFromRawValue(EPROTO) }
    public static var timeout: Error { self.makeFromRawValue(ETIME) }
    public static var notSupportedOnSocket: Error { self.makeFromRawValue(EOPNOTSUPP) }
    public static var wouldBlock: Error { self.makeFromRawValue(EWOULDBLOCK) }
    public static var tooManyReferences: Error { self.makeFromRawValue(ETOOMANYREFS) }
    public static var tooManyRemoteLevels: Error { self.makeFromRawValue(EREMOTE) }
    public static var noSuchPolicy: Error { self.makeFromRawValue(ENOPOLICY) }
    public static var notRecoverable: Error { self.makeFromRawValue(ENOTRECOVERABLE) }
    public static var previousOwnerDied: Error { self.makeFromRawValue(EOWNERDEAD) }
    public static var outputQueueFull: Error { self.makeFromRawValue(EQFULL) }
    public static var lastErrnoValue: Error { self.makeFromRawValue(ELAST) }
}
