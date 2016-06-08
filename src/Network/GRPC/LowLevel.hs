-- | Low-level safe interface to gRPC. By "safe", we mean:
-- 1. all gRPC objects are guaranteed to be cleaned up correctly.
-- 2. all functions are thread-safe.
-- 3. all functions leave gRPC in a consistent, safe state.
-- These guarantees only apply to the functions exported by this module,
-- and not to helper functions in submodules that aren't exported here.

{-# LANGUAGE RecordWildCards #-}

module Network.GRPC.LowLevel (
-- * Important types
GRPC
, withGRPC
, GRPCIOError(..)
, StatusCode(..)

-- * Completion queue utilities
, CompletionQueue
, withCompletionQueue

-- * Calls
, GRPCMethodType(..)
, RegisteredMethod
, NormalRequestResult(..)
, MetadataMap
, MethodName(..)
, StatusDetails(..)

-- * Server
, ServerConfig(..)
, Server
, ServerRegCall
, registeredMethods
, withServer
, serverHandleNormalRegisteredCall
, withServerRegisteredCall

-- * Client
, ClientConfig(..)
, Client
, ClientCall
, ConnectivityState(..)
, clientConnectivity
, withClient
, clientRegisterMethod
, clientRegisteredRequest
, clientRequest
, withClientCall

-- * Ops
, runClientOps
, runServerRegOps
, Op(..)
, OpRecvResult(..)

) where

import           Network.GRPC.LowLevel.GRPC
import           Network.GRPC.LowLevel.Server
import           Network.GRPC.LowLevel.CompletionQueue
import           Network.GRPC.LowLevel.Op
import           Network.GRPC.LowLevel.Client
import           Network.GRPC.LowLevel.Client.Unregistered
import           Network.GRPC.LowLevel.Call

import Network.GRPC.Unsafe (ConnectivityState(..))
import Network.GRPC.Unsafe.Op (StatusCode(..))
