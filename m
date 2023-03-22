Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB836C4A66
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 22 Mar 2023 13:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90EA10E925;
	Wed, 22 Mar 2023 12:27:24 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B3710E0F6;
 Wed, 22 Mar 2023 12:27:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxziKlBJdzPl4V9+plk95anT1/5MREGoF/PSXvumr5rsSNq/pGuRvabslnYksWxaEPDhcqbzkz76WuKmNNNU8TgtxtsipGvoLHdjkdioPRl7dwIiahy2wEPMclnbuHMnzb3QdFOCHWLtKf5G7QIFSmI7uuBW812ZTAZNGnf8sevltCzPYYKpW5jtFawr3nXHO5VWH2sXspS3l2URsD23N53l+Nm9FhOQFrzUragi743Jpz3xTfV6w8/X8RQz4S0yarAcaeu8J8uIaPRL4BpD24cvmvH/bKdmpWTYBLcpKX2cLVJkuoqPbejGQpu+RJjovzcDOVjeOpGmVBQHGQmiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ofQf1GCjsaM02INv+4AjmSPZ7bgDaaJ2JAmijQl75Q=;
 b=QeRr4OyygY/K3BQKCCmXrnoyQjDFYVho0rSTbyA4mOGnLdIwILrFoKw3VYksKJuR247y8GiSpUFkJff9E43uVGX4RdHoTflbDuzuSptjbaDb7Jv5VRXxa4LWT7ior1bie3J/4rVOF5DipB+CDP9KL4MvKdwlofK8vU4/MoV4ancbHI9VD7WKf5hgo8nDLg05a6oCC3RRDJtN3r7d2Fh1FFQOISezfzYUrm6T9NvMr+XgfMcToHvmPq3mO9L/llr9KCvkcJOP5VG72BjOPp0WrTKzEGARYhtQ44lSVVEtbsgvWNOpy6h3H1w5r6c1krmkVpqhHN3TNOhTDR8i1sdFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ofQf1GCjsaM02INv+4AjmSPZ7bgDaaJ2JAmijQl75Q=;
 b=jt5zK0X8eKVXsZCAVeiXImnOO+sFEXVx0v0/0RNOKl4mO5vY8W8NCYEC22lRWIa4JFTKYT3EjCZt00zT0iDhR7sp84FEKZTbIGOP7JjZFojDAsgdqN64qnttPJ0UAJPKtqFp+rd1I0xSgXAjp9suA21dQkEk9UMoL3fH+QjT0+gt3MSZrUC+vMeV9Ro2pCyis6jyX9REz8FLqNbaqr+ZdDXaRjgmrPH59brULWGUp1aewWYBeh+uFrYWKvu7gVeTKX0QChxn4hPN1tA3U7FPIZTA5TqEv3CDY8J5LZ02xSLgtt3fAQRTf8SooIZ7Du9R9r6b89YEw1vi1df0gNDDYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB8463.namprd12.prod.outlook.com (2603:10b6:610:187::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.36; Wed, 22 Mar
 2023 12:27:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::ef6d:fdf6:352f:efd1%3]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 12:27:18 +0000
Date: Wed, 22 Mar 2023 09:27:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v6 12/24] vfio/pci: Allow passing zero-length fd array in
 VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <ZBr0JD7nPBM6Zr1z@nvidia.com>
References: <BN9PR11MB5276D5A71E43EA4CDD1C960A8CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230317091557.196638a6.alex.williamson@redhat.com>
 <ZBiUiEC8Xj9sOphr@nvidia.com>
 <20230320165217.5b1019a4.alex.williamson@redhat.com>
 <ZBjum1wQ1L2AIfhB@nvidia.com>
 <20230321143122.632f7e63.alex.williamson@redhat.com>
 <ZBoYgNq60eDpV9Un@nvidia.com>
 <20230321150112.1c482380.alex.williamson@redhat.com>
 <ZBottXxBlOsXmnmX@nvidia.com>
 <20230321164737.62b45132.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321164737.62b45132.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:208:51::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8b342f-64da-42cf-5beb-08db2ad0c6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqd8aHJU66ngJWFa9y0Vbi/wXQz/Kb5TfUr7PM2bqBnWvzYNziRQqXuOhJqN2Xj1nCHx4bMQrU/1XOeJTIDkGldy8jPWQEDzirDCkA4ZtE6frfodBwsUstzx4ITP7uMCIV+sJPbcIe3PmZ4b6SPrdOF5OjRdMAugqCYdJgqsKDP2qyO9xBpiV6Ma+2Xb7z24QEEcNHWDtw+vAeUjmqzfYJo833v2naxhliql7z0E8lWF61z8ERp/GVVRxozwdihDzfsFQoIAvVk5dxoWGGvtmqbZj/PlbPCieKNzsreCrrrsf7G5msuMdOAoLCJ/h/Ogb9Zl7TlmkKt5KtDk+Xpp/XxzDQvNgiZonCma64jQWlKZ7soGQ91RTgKMgAqEn/8kMWve+/RvPpdNUktIqF/3sWB2l0lLITVtji5FrwluE9V78dIX9SW5vpu3WTW9/hA9F0IqKI6qW0qH7RUYsoT6Gvxl9U+nvx9uJtIBZ3glMGmE/r6ViOtd8ro9LjE/qzA80/PvCUw0BZ0G0FyoUjkfg8KAj8QxJHWan3JvuvE6OreCBtKsA/K27dmf8TpfzAGE4SNKO5WIWN8gn8hTkea1/faFD5vnEH8EtVN888WGRPjXFus5IKQ6il5Ao+mAzKZadXuvOBNh+4rSpEC88Ux6MQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199018)(86362001)(6916009)(478600001)(54906003)(66946007)(41300700001)(8936002)(4326008)(66476007)(36756003)(316002)(66556008)(8676002)(7416002)(83380400001)(2906002)(26005)(38100700002)(6512007)(6506007)(186003)(6486002)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6M7YI/xZCefB08iAHdpYq2vV2+Ro3dEk+VbIhFQRE/oJqDzFMlrKpTUYBBB9?=
 =?us-ascii?Q?Vp1pORNw+bLYb2+1GXODRpYnKJ3a/fXSxUv+V3Z9u0oYZepC46T7Efu1+j9f?=
 =?us-ascii?Q?YEuF8hB3fst500v8WMdY0icrg/B1tECZV83LtANHlezmlsqIescGOoy8mZVN?=
 =?us-ascii?Q?cI8+dDBFhlHpBul5sOAMc3JXbfC573k/Ags4Lv3hT38lhAXNxpkUW0vCQDTV?=
 =?us-ascii?Q?nISjWGNYG4t1c+UdGZSIrA2vbi44ujfJKYklPYseQi2OxDxcRM4M/EL+aqee?=
 =?us-ascii?Q?P0uI4tIAuQ1f9Ckd3lnaA8HNgu0VeSXS5bxFh1IuEkWbJorvWEY2qHr1/cRB?=
 =?us-ascii?Q?FYWhGCE5E8N1EIW/Io/fJRft+vyGEI9Ce8nGazM3XRMPRKn6eHT2usZYuZ8G?=
 =?us-ascii?Q?bb/jrWz5Qyh9sK9Y5wX8pfSdrPUaL29DGORzRrAO9MMIMeXnfjsKo38dc6pi?=
 =?us-ascii?Q?M2DUXHMMluUGHfnJdJfVVj1hceG6IR8prmhYjZEsvFjLk4yUwwAk7boKhO3D?=
 =?us-ascii?Q?lR+alThPT9vL+hXCAcdMHCStAgnzcK8UwDVHHCLyk85ekm1omEOGVvN3FY3H?=
 =?us-ascii?Q?VNdN4jnv7P4SlmQ0xlyarjkwfc9GRndE2bVzd8jCkY73rRBipz7kyoyJDUU7?=
 =?us-ascii?Q?YX2KsQFsw10fuRx+ypwWBaJ38+myV5/aguwJ80XXUb8qvdmJx9XgXrElhK7O?=
 =?us-ascii?Q?jycaegJPLovLhKeIDsE86NgPQPrmcGc7hwR1EW+KfspCGQlMZ2bTMIu+aJRQ?=
 =?us-ascii?Q?szACAZlVslIgzpeeXJ7uxl3njiA/IwORcVMfnA53KlVDQGRSTTHi8vLVAp6B?=
 =?us-ascii?Q?4PYU+/P1rjjWZ6fanmJPgujHsXdA2yU2KHXD2l+mGy/f6q41CXHDhQ9RhkS+?=
 =?us-ascii?Q?vkIWKNbRyPhqtf/5WeXXlfJjv+SerEivFHTejCdf+J6U6ekqsSTJS0TKhgd+?=
 =?us-ascii?Q?3ladXt6YN2cmy7pMhFISgS414NB39jPcuIY0mTRaz4BUhGw/cXbaXDAdccI4?=
 =?us-ascii?Q?NjNoyeCbLLH6T1IZssLW+YxE99GIfSrznve1jEOmdHqCTulVCxNM8IrLLiJV?=
 =?us-ascii?Q?IwFgb8Ne5/Tyq5KmFs6FcWE0anxZTE9Imib1D2kHo9sqhbPzO2t1ibeeQUxF?=
 =?us-ascii?Q?UFQ9Hwwk7DiLUWs0iLay6hoG2QozoZqp2/80tv44NcPfob1AdIBdTG61jpek?=
 =?us-ascii?Q?MkbnBw0klLWWM2qaKVwPBctHhMUcljJY6knsHyAjyqQKrnnuHZPeClRQo8rO?=
 =?us-ascii?Q?mYTtiXmtk1g60gsymV/fQSbSHkbx0oekFM+MEa/sZTOj7wZbciIA18SsQR21?=
 =?us-ascii?Q?d6w8RugDpTNdxpnto6ku4IlE9TwgidrAF3JauPc5Tkpxo46uupCK5nEHhAeH?=
 =?us-ascii?Q?7XnFJCpvoMV4ZXrWQECIqTfdbexdPQB35k+J6o+IAUJBroMs9sL+kldqYcCW?=
 =?us-ascii?Q?sHV7AsxmIxGf3GDRH1S2RMHAQo7uO2/7bmiSdkUKxyBoM4zzWdqJisckcoXa?=
 =?us-ascii?Q?nwG0XapDNYZKVCWHs5t6AwSFC6fQfFH/3q0N6ZAeFnS34Xs5/islzWbZFv1a?=
 =?us-ascii?Q?2Blr2JTIkSlC+e+dWn+btm8xAC0WJMwpHQ4QPmKY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8b342f-64da-42cf-5beb-08db2ad0c6b6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 12:27:18.0179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpWRkEsldG9YKZD4cNEaT5arRG8A57AdQNBntmqZ4VDSbPPzQGQvLSRFlWrmeiL/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8463
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao,
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 04:47:37PM -0600, Alex Williamson wrote:
> On Tue, 21 Mar 2023 19:20:37 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Tue, Mar 21, 2023 at 03:01:12PM -0600, Alex Williamson wrote:
> > 
> > > > Though it would be nice if qemu didn't need two implementations so Yi
> > > > I'd rather see a new info in this series as well and qemu can just
> > > > consistently use dev_id and never bdf in iommufd mode.  
> > > 
> > > We also need to consider how libvirt determines if QEMU has the kernel
> > > support it needs to pass file descriptors.  It'd be a lot cleaner if
> > > this aligned with the introduction of vfio cdevs.  
> > 
> > Yes, that would be much better if it was one package.
> > 
> > But this is starting to grow and we have so many threads that need to
> > progress blocked on this cdev enablement :(
> > 
> > Could we go forward with the cdev main patches and kconfig it to
> > experimental or something while the rest of the parts are completed
> > and tested through qemu? ie move the vfio-pci reset enablment to after
> > the cdev patches?
> 
> We need to be able to guarantee that there cannot be any significant
> builds of the kernel with vfio cdev support if our intention is to stage
> it for libvirt.  We don't have a global EXPERIMENTAL config option any
> more.  Adding new code under BROKEN seems wrong.  Fedora ships with
> STAGING enabled.  A sternly worded Kconfig entry is toothless.  What is
> the proposed mechanism to make this not look like a big uncompiled code
> dump?  Thanks,

I would suggest a sternly worded kconfig and STAGING.

This isn't such a big issue, we are trying to say that a future
released qemu is not required to work on older kernels with a STAGING
kconfig mark.

IOW we are saying that qemu release X.0 with production iommufd
requires kernel version > x.y and just lightly reflecting this into
the kconfig.

qemu should simply not support iommufd if it finds itself on a old
kernel.

Jason
